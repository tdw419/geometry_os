; DESCRIPTION: Places a cyan 78x120 box at position (237, 154).
; PLAN: r0=237(x), r1=154(y), r2=78(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 154
LDI r2, 78
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
