; DESCRIPTION: Places a cyan 54x112 rectangle at position (111, 80).
; PLAN: r0=111(x), r1=80(y), r2=54(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 80
LDI r2, 54
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
