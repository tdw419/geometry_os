; DESCRIPTION: Renders a cyan box of size 77x60 starting at (79, 133).
; PLAN: r0=79(x), r1=133(y), r2=77(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 133
LDI r2, 77
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
