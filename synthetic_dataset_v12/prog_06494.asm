; DESCRIPTION: Places a cyan 12x81 rectangle at position (169, 82).
; PLAN: r0=169(x), r1=82(y), r2=12(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 82
LDI r2, 12
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
