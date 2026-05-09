; DESCRIPTION: Composite: . Then Renders a orange line between points (123, 27) and (236, 0). Then Places a green 65x38 rectangle at position (184, 210).
; PLAN: r0=123(x1), r1=27(y1), r2=236(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=184(x), r1=210(y), r2=65(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange line between points (123, 27) and (236, 0).
; PLAN: r0=123(x1), r1=27(y1), r2=236(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 27
LDI r2, 236
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green 65x38 rectangle at position (184, 210).
; PLAN: r0=184(x), r1=210(y), r2=65(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 210
LDI r2, 65
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
