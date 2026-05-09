; DESCRIPTION: Places a orange 40x42 rectangle at position (177, 192).
; PLAN: r0=177(x), r1=192(y), r2=40(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 192
LDI r2, 40
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
