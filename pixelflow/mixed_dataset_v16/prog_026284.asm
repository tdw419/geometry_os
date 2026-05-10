; DESCRIPTION: Renders a blue box of size 41x19 starting at (403, 197).
; PLAN: r0=403(x), r1=197(y), r2=41(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 197
LDI r2, 41
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
