; DESCRIPTION: Places a blue 27x53 rectangle at position (226, 177).
; PLAN: r0=226(x), r1=177(y), r2=27(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 177
LDI r2, 27
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
