; DESCRIPTION: Renders a cyan box of size 38x46 starting at (79, 200).
; PLAN: r0=79(x), r1=200(y), r2=38(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 200
LDI r2, 38
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
