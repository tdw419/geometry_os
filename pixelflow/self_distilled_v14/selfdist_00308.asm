; DESCRIPTION: Places a cyan 61x88 box at position (295, 163).
; PLAN: r0=295(x), r1=163(y), r2=61(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 163
LDI r2, 61
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
