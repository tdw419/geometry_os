; DESCRIPTION: Renders a cyan box of size 14x25 starting at (171, 69).
; PLAN: r0=171(x), r1=69(y), r2=14(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 69
LDI r2, 14
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
