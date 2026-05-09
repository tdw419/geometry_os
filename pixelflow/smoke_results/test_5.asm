; DESCRIPTION: Clears the screen to black and then halts.
; PLAN: r0=0x1121(y), r2=0x000000(color). Op: SUB r0, r1, r2.
LDI r0, 000
LDI r1, 159
LDI r2, 0x0000
FILL r0
HALT