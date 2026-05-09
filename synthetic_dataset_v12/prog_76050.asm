; DESCRIPTION: Renders a yellow box of size 120x41 starting at (242, 161).
; PLAN: r0=242(x), r1=161(y), r2=120(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 161
LDI r2, 120
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
