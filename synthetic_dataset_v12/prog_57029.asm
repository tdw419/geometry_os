; DESCRIPTION: Places a black 87x54 rectangle at position (401, 154).
; PLAN: r0=401(x), r1=154(y), r2=87(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 154
LDI r2, 87
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
