; DESCRIPTION: Places a cyan 92x80 rectangle at position (17, 61).
; PLAN: r0=17(x), r1=61(y), r2=92(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 61
LDI r2, 92
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
