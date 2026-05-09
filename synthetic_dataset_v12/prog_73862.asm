; DESCRIPTION: Places a cyan 82x93 rectangle at position (235, 90).
; PLAN: r0=235(x), r1=90(y), r2=82(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 90
LDI r2, 82
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
