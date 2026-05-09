; DESCRIPTION: Places a green 48x40 rectangle at position (183, 159).
; PLAN: r0=183(x), r1=159(y), r2=48(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 159
LDI r2, 48
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
