; DESCRIPTION: Places a green 24x64 rectangle at position (28, 112).
; PLAN: r0=28(x), r1=112(y), r2=24(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 112
LDI r2, 24
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
