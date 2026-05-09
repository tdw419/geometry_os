; DESCRIPTION: Places a cyan 24x109 rectangle at position (143, 30).
; PLAN: r0=143(x), r1=30(y), r2=24(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 30
LDI r2, 24
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
