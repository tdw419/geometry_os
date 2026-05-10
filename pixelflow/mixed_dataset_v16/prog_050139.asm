; DESCRIPTION: Places a cyan 94x92 rectangle at position (192, 55).
; PLAN: r0=192(x), r1=55(y), r2=94(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 55
LDI r2, 94
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
