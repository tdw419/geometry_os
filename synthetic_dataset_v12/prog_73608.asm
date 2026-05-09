; DESCRIPTION: Places a cyan 76x95 rectangle at position (320, 82).
; PLAN: r0=320(x), r1=82(y), r2=76(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 82
LDI r2, 76
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
