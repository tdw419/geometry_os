; DESCRIPTION: Places a red 12x64 rectangle at position (47, 154).
; PLAN: r0=47(x), r1=154(y), r2=12(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 154
LDI r2, 12
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
