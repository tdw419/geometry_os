; DESCRIPTION: Places a cyan 95x92 rectangle at position (147, 55).
; PLAN: r0=147(x), r1=55(y), r2=95(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 55
LDI r2, 95
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
