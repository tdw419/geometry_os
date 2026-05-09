; DESCRIPTION: Renders a cyan box of size 110x33 starting at (107, 171).
; PLAN: r0=107(x), r1=171(y), r2=110(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 171
LDI r2, 110
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
