; DESCRIPTION: Composite: . Then Renders a yellow line between points (245, 233) and (210, 54). Then Places a orange 43x43 rectangle at position (39, 120).
; PLAN: r0=245(x1), r1=233(y1), r2=210(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=39(x), r1=120(y), r2=43(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (245, 233) and (210, 54).
; PLAN: r0=245(x1), r1=233(y1), r2=210(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 233
LDI r2, 210
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 43x43 rectangle at position (39, 120).
; PLAN: r0=39(x), r1=120(y), r2=43(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 120
LDI r2, 43
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
