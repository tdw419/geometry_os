; DESCRIPTION: Places a cyan 28x85 rectangle at position (120, 144).
; PLAN: r0=120(x), r1=144(y), r2=28(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 144
LDI r2, 28
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
