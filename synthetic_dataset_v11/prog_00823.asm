; DESCRIPTION: Places a yellow 57x64 rectangle at position (95, 11).
; PLAN: r0=95(x), r1=11(y), r2=57(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 11
LDI r2, 57
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
