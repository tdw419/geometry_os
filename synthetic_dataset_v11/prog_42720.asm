; DESCRIPTION: Places a cyan 85x100 rectangle at position (48, 113).
; PLAN: r0=48(x), r1=113(y), r2=85(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 113
LDI r2, 85
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
