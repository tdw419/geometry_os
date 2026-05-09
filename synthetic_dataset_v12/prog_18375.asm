; DESCRIPTION: Places a green 27x71 rectangle at position (450, 174).
; PLAN: r0=450(x), r1=174(y), r2=27(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 174
LDI r2, 27
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
