; DESCRIPTION: Places a cyan 82x107 rectangle at position (162, 95).
; PLAN: r0=162(x), r1=95(y), r2=82(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 95
LDI r2, 82
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
