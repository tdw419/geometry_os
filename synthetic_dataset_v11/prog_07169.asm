; DESCRIPTION: Composite: . Then Renders a orange box of size 101x41 starting at (64, 16). Then Renders a red line between points (208, 132) and (24, 224).
; PLAN: r0=64(x), r1=16(y), r2=101(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=208(x1), r1=132(y1), r2=24(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange box of size 101x41 starting at (64, 16).
; PLAN: r0=64(x), r1=16(y), r2=101(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 16
LDI r2, 101
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red line between points (208, 132) and (24, 224).
; PLAN: r0=208(x1), r1=132(y1), r2=24(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 132
LDI r2, 24
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
