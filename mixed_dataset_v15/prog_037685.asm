; DESCRIPTION: Places a white 91x64 rectangle at position (161, 91).
; PLAN: r0=161(x), r1=91(y), r2=91(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 91
LDI r2, 91
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
