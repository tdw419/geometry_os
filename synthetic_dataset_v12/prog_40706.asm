; DESCRIPTION: Places a white 60x32 rectangle at position (328, 192).
; PLAN: r0=328(x), r1=192(y), r2=60(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 192
LDI r2, 60
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
