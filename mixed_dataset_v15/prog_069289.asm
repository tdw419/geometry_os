; DESCRIPTION: Renders a cyan box of size 98x32 starting at (171, 207).
; PLAN: r0=171(x), r1=207(y), r2=98(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 207
LDI r2, 98
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
