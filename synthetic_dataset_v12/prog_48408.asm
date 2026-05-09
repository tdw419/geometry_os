; DESCRIPTION: Places a white 64x64 rectangle at position (320, 192).
; PLAN: r0=320(x), r1=192(y), r2=64(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 192
LDI r2, 64
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
