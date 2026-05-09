; DESCRIPTION: Renders a green box of size 117x23 starting at (46, 161).
; PLAN: r0=46(x), r1=161(y), r2=117(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 161
LDI r2, 117
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
