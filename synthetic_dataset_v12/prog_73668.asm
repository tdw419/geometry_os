; DESCRIPTION: Places a cyan 38x92 rectangle at position (439, 9).
; PLAN: r0=439(x), r1=9(y), r2=38(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 9
LDI r2, 38
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
