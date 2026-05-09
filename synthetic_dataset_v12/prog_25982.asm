; DESCRIPTION: Places a yellow 27x111 rectangle at position (294, 129).
; PLAN: r0=294(x), r1=129(y), r2=27(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 129
LDI r2, 27
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
