; DESCRIPTION: Places a yellow 28x115 rectangle at position (262, 96).
; PLAN: r0=262(x), r1=96(y), r2=28(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 96
LDI r2, 28
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
