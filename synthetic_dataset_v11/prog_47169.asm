; DESCRIPTION: Places a cyan 61x81 rectangle at position (82, 95).
; PLAN: r0=82(x), r1=95(y), r2=61(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 95
LDI r2, 61
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
