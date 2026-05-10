; DESCRIPTION: Renders a cyan box of size 47x46 starting at (223, 141).
; PLAN: r0=223(x), r1=141(y), r2=47(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 141
LDI r2, 47
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
