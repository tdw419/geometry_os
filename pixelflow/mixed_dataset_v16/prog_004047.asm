; DESCRIPTION: Places a white 54x64 rectangle at position (57, 121).
; PLAN: r0=57(x), r1=121(y), r2=54(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 121
LDI r2, 54
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
