; DESCRIPTION: Places a white 49x45 rectangle at position (77, 192).
; PLAN: r0=77(x), r1=192(y), r2=49(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 192
LDI r2, 49
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
