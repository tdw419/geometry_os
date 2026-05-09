; DESCRIPTION: Places a cyan 17x76 rectangle at position (218, 95).
; PLAN: r0=218(x), r1=95(y), r2=17(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 95
LDI r2, 17
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
