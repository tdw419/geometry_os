; DESCRIPTION: Places a cyan 82x79 rectangle at position (18, 20).
; PLAN: r0=18(x), r1=20(y), r2=82(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 20
LDI r2, 82
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
