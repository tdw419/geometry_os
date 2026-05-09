; DESCRIPTION: Composite: . Then Places a white 32x120 rectangle at position (56, 17). Then Renders a black line between points (43, 230) and (66, 21).
; PLAN: r0=56(x), r1=17(y), r2=32(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=43(x1), r1=230(y1), r2=66(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white 32x120 rectangle at position (56, 17).
; PLAN: r0=56(x), r1=17(y), r2=32(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 17
LDI r2, 32
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black line between points (43, 230) and (66, 21).
; PLAN: r0=43(x1), r1=230(y1), r2=66(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 230
LDI r2, 66
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
