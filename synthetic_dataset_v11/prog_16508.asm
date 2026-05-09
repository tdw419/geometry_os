; DESCRIPTION: Places a green 27x79 rectangle at position (3, 96).
; PLAN: r0=3(x), r1=96(y), r2=27(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 96
LDI r2, 27
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
