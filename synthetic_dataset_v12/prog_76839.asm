; DESCRIPTION: Renders a green box of size 113x52 starting at (273, 50).
; PLAN: r0=273(x), r1=50(y), r2=113(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 50
LDI r2, 113
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
