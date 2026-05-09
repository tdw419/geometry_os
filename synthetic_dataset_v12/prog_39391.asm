; DESCRIPTION: Renders a green box of size 103x41 starting at (21, 204).
; PLAN: r0=21(x), r1=204(y), r2=103(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 204
LDI r2, 103
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
