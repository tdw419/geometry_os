; DESCRIPTION: Places a green 38x61 rectangle at position (68, 192).
; PLAN: r0=68(x), r1=192(y), r2=38(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 192
LDI r2, 38
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
