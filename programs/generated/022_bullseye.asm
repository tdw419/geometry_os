; 022_bullseye.asm -- Concentric bullseye target with alternating red and white rings
; Center at (128,128), 5 rings from outer (radius 100) to inner (radius 20)

; Outermost ring - red, radius 100
LDI r0, 128
LDI r1, 128
LDI r2, 100
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3

; Ring 2 - white, radius 80
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3

; Ring 3 - red, radius 60
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3

; Ring 4 - white, radius 40
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3

; Bullseye center - red, radius 20
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3

HALT
