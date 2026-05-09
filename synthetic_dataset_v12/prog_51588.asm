; DESCRIPTION: Places a green 50x20 rectangle at position (253, 169).
; PLAN: r0=253(x), r1=169(y), r2=50(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 169
LDI r2, 50
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
