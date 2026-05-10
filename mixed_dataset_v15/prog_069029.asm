; DESCRIPTION: Places a cyan 30x59 rectangle at position (173, 75).
; PLAN: r0=173(x), r1=75(y), r2=30(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 75
LDI r2, 30
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
