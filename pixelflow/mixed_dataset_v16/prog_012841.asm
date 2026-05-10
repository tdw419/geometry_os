; DESCRIPTION: Places a blue 44x53 rectangle at position (434, 143).
; PLAN: r0=434(x), r1=143(y), r2=44(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 143
LDI r2, 44
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
