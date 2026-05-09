; DESCRIPTION: Places a white 48x20 rectangle at position (269, 97).
; PLAN: r0=269(x), r1=97(y), r2=48(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 97
LDI r2, 48
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
