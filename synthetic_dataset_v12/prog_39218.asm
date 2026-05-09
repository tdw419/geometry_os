; DESCRIPTION: Places a cyan 98x113 rectangle at position (269, 133).
; PLAN: r0=269(x), r1=133(y), r2=98(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 133
LDI r2, 98
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
