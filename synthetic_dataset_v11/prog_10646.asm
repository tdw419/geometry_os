; DESCRIPTION: Places a green 54x38 rectangle at position (52, 17).
; PLAN: r0=52(x), r1=17(y), r2=54(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 17
LDI r2, 54
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
