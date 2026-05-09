; DESCRIPTION: Composite: . Then Places a purple 105x62 rectangle at position (77, 146). Then Renders a orange disk with center (180, 165) and radius 19.
; PLAN: r0=77(x), r1=146(y), r2=105(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=180(x), r1=165(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple 105x62 rectangle at position (77, 146).
; PLAN: r0=77(x), r1=146(y), r2=105(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 146
LDI r2, 105
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (180, 165) and radius 19.
; PLAN: r0=180(x), r1=165(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 165
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
